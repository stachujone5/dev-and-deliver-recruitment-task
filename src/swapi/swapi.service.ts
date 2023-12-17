import { Injectable } from '@nestjs/common';
import { Cron, CronExpression } from '@nestjs/schedule';
import { Prisma } from '@prisma/client';
import { ZodSchema, z } from 'zod';
import {
  filmSchema,
  peopleSchema,
  planetSchema,
  speciesSchema,
  starshipSchema,
  vehicleSchema
} from './swapi.schema';
import { PrismaService } from '../prisma/prisma.service';

const BASE_URL = 'https://swapi.dev/api/';

@Injectable()
export class SwapiService {
  constructor(private prisma: PrismaService) {}
  private isFirstRun = false;

  private async fetchResource<T extends ZodSchema>(url: string, schema: T) {
    const response = await fetch(url);

    if (!response.ok) {
      throw new Error(`Failed to fetch swapi resource from ${url}`);
    }

    const data = (await response.json()) as unknown;

    return schema.parse(data) as z.infer<T>;
  }

  private async fetchFilms() {
    const filmsResponse = await this.fetchResource(
      `${BASE_URL}films/`,
      z.object({ results: z.array(filmSchema), next: z.string().url().nullable() })
    );

    for (const filmData of filmsResponse.results) {
      const createOrUpdate: Prisma.FilmUpsertArgs['create'] = {
        created: filmData.created,
        director: filmData.director,
        edited: filmData.edited,
        episodeId: filmData.episode_id,
        openingCrawl: filmData.opening_crawl,
        producer: filmData.producer,
        releaseDate: filmData.release_date,
        title: filmData.title,
        url: filmData.url
      };

      await this.prisma.film.upsert({
        where: { url: filmData.url },
        create: createOrUpdate,
        update: createOrUpdate
      });
    }
  }

  private async fetchStarships() {
    let nextUrl: string | null = `${BASE_URL}starships/`;

    while (nextUrl) {
      const starshipsResponse = await this.fetchResource(
        nextUrl,
        z.object({ results: z.array(starshipSchema), next: z.string().url().nullable() })
      );

      for (const starshipData of starshipsResponse.results) {
        const createOrUpdate: Prisma.StarshipUpsertArgs['create'] = {
          mglt: starshipData.MGLT,
          cargoCapacity: starshipData.cargo_capacity,
          consumables: starshipData.consumables,
          costInCredits: starshipData.cost_in_credits,
          created: starshipData.created,
          crew: starshipData.crew,
          edited: starshipData.edited,
          hyperdriveRating: starshipData.hyperdrive_rating,
          length: starshipData.length,
          manufacturer: starshipData.manufacturer,
          maxAtmospheringSpeed: starshipData.max_atmosphering_speed,
          model: starshipData.model,
          name: starshipData.name,
          passengers: starshipData.passengers,
          starshipClass: starshipData.starship_class,
          url: starshipData.url
        };
        await this.prisma.starship.upsert({
          where: { url: starshipData.url },
          create: createOrUpdate,
          update: createOrUpdate
        });
      }

      nextUrl = starshipsResponse.next;
    }
  }

  private async fetchSpecies() {
    let nextUrl: string | null = `${BASE_URL}species/`;

    while (nextUrl) {
      const speciesResponse = await this.fetchResource(
        nextUrl,
        z.object({ results: z.array(speciesSchema), next: z.string().url().nullable() })
      );

      for (const speciesData of speciesResponse.results) {
        const createOrUpdate: Prisma.SpeciesUpsertArgs['create'] = {
          averageHeight: speciesData.average_height,
          averageLifespan: speciesData.average_lifespan,
          classification: speciesData.classification,
          created: speciesData.created,
          designation: speciesData.designation,
          edited: speciesData.edited,
          eyeColors: speciesData.eye_colors,
          hairColors: speciesData.hair_colors,
          language: speciesData.language,
          name: speciesData.name,
          skinColors: speciesData.skin_colors,
          url: speciesData.url
        };

        await this.prisma.species.upsert({
          where: { url: speciesData.url },
          create: createOrUpdate,
          update: createOrUpdate
        });
        nextUrl = speciesResponse.next;
      }
    }
  }

  private async fetchVehicles() {
    let nextUrl: string | null = `${BASE_URL}vehicles/`;

    while (nextUrl) {
      const vehiclesResponse = await this.fetchResource(
        nextUrl,
        z.object({ results: z.array(vehicleSchema), next: z.string().url().nullable() })
      );

      for (const vehicleData of vehiclesResponse.results) {
        const createOrUpdate: Prisma.VehicleUpsertArgs['create'] = {
          cargoCapacity: vehicleData.cargo_capacity,
          consumables: vehicleData.consumables,
          costInCredits: vehicleData.cost_in_credits,
          created: vehicleData.created,
          crew: vehicleData.crew,
          edited: vehicleData.edited,
          length: vehicleData.length,
          manufacturer: vehicleData.manufacturer,
          maxAtmospheringSpeed: vehicleData.max_atmosphering_speed,
          model: vehicleData.model,
          name: vehicleData.name,
          passengers: vehicleData.passengers,
          url: vehicleData.url,
          vehicleClass: vehicleData.vehicle_class
        };
        await this.prisma.vehicle.upsert({
          where: { url: vehicleData.url },
          create: createOrUpdate,
          update: createOrUpdate
        });
      }

      nextUrl = vehiclesResponse.next;
    }
  }

  private async fetchPeople() {
    let nextUrl: string | null = `${BASE_URL}people/`;

    while (nextUrl) {
      const peopleResponse = await this.fetchResource(
        nextUrl,
        z.object({ results: z.array(peopleSchema), next: z.string().url().nullable() })
      );

      for (const peopleData of peopleResponse.results) {
        const createOrUpdate: Prisma.CharacterUpsertArgs['create'] = {
          birthYear: peopleData.birth_year,
          created: peopleData.created,
          edited: peopleData.edited,
          eyeColor: peopleData.eye_color,
          gender: peopleData.gender,
          hairColor: peopleData.hair_color,
          height: peopleData.height,
          mass: peopleData.mass,
          name: peopleData.name,
          skinColor: peopleData.skin_color,
          url: peopleData.url
        };

        await this.prisma.character.upsert({
          where: { url: peopleData.url },
          create: createOrUpdate,
          update: createOrUpdate
        });
      }

      nextUrl = peopleResponse.next;
    }
  }

  private async fetchPlanets() {
    let nextUrl: string | null = `${BASE_URL}planets/`;

    while (nextUrl) {
      const planetsResponse = await this.fetchResource(
        nextUrl,
        z.object({ results: z.array(planetSchema), next: z.string().url().nullable() })
      );

      for (const planetData of planetsResponse.results) {
        const createOrUpdate: Prisma.PlanetUpsertArgs['create'] = {
          climate: planetData.climate,
          created: planetData.created,
          diameter: planetData.diameter,
          edited: planetData.edited,
          gravity: planetData.gravity,
          name: planetData.name,
          orbitalPeriod: planetData.orbital_period,
          population: planetData.population,
          rotationPeriod: planetData.rotation_period,
          surfaceWater: planetData.surface_water,
          terrain: planetData.terrain,
          url: planetData.url
        };
        await this.prisma.planet.upsert({
          where: { url: planetData.url },
          create: createOrUpdate,
          update: createOrUpdate
        });
      }
      nextUrl = planetsResponse.next;
    }
  }

  @Cron(CronExpression.EVERY_DAY_AT_MIDNIGHT)
  async handleCron() {
    await this.getData();
  }

  async onApplicationBootstrap() {
    if (this.isFirstRun) {
      await this.getData();
      this.isFirstRun = false;
    }
  }

  async getData() {
    await Promise.all([
      this.fetchFilms(),
      this.fetchPlanets(),
      this.fetchPeople(),
      this.fetchVehicles(),
      this.fetchSpecies(),
      this.fetchStarships()
    ]);
  }
}
