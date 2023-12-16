import { z } from 'zod';

export const filmSchema = z.object({
  title: z.string().min(1),
  episode_id: z.number().int(),
  opening_crawl: z.string().min(1),
  director: z.string().min(1),
  producer: z.string().min(1),
  release_date: z.string().min(1),
  species: z.array(z.string().url()),
  starships: z.array(z.string().url()),
  vehicles: z.array(z.string().url()),
  characters: z.array(z.string().url()),
  planets: z.array(z.string().url()),
  url: z.string().url(),
  created: z.string().min(1),
  edited: z.string().min(1)
});

export const peopleSchema = z.object({
  birth_year: z.string().min(1),
  eye_color: z.string().min(1),
  films: z.array(z.string().url()),
  gender: z.string().min(1),
  hair_color: z.string().min(1),
  height: z.string().min(1),
  homeworld: z.string().url(),
  mass: z.string().min(1),
  name: z.string().min(1),
  skin_color: z.string().min(1),
  created: z.string().min(1),
  edited: z.string().min(1),
  species: z.array(z.string().url()),
  starships: z.array(z.string().url()),
  url: z.string().url(),
  vehicles: z.array(z.string().url())
});

export const planetSchema = z.object({
  climate: z.string().min(1),
  created: z.string().min(1),
  diameter: z.string().min(1),
  edited: z.string().min(1),
  films: z.array(z.string().url()),
  gravity: z.string().min(1),
  name: z.string().min(1),
  orbital_period: z.string().min(1),
  population: z.string().min(1),
  residents: z.array(z.string().url()),
  rotation_period: z.string().min(1),
  surface_water: z.string().min(1),
  terrain: z.string().min(1),
  url: z.string().url()
});

export const speciesSchema = z.object({
  average_height: z.string().min(1),
  average_lifespan: z.string().min(1),
  classification: z.string().min(1),
  created: z.string().min(1),
  designation: z.string().min(1),
  edited: z.string().min(1),
  eye_colors: z.string().min(1),
  hair_colors: z.string().min(1),
  homeworld: z.string().url().nullable(),
  language: z.string().min(1),
  name: z.string().min(1),
  people: z.array(z.string().url()),
  films: z.array(z.string().url()),
  skin_colors: z.string().min(1),
  url: z.string().url()
});

export const starshipSchema = z.object({
  MGLT: z.string().min(1),
  cargo_capacity: z.string().min(1),
  consumables: z.string().min(1),
  cost_in_credits: z.string().min(1),
  created: z.string().min(1),
  crew: z.string().min(1),
  edited: z.string().min(1),
  films: z.array(z.string().url()),
  hyperdrive_rating: z.string().min(1),
  length: z.string().min(1),
  manufacturer: z.string().min(1),
  max_atmosphering_speed: z.string().min(1),
  model: z.string().min(1),
  name: z.string().min(1),
  passengers: z.string().min(1),
  pilots: z.array(z.string().url()),
  starship_class: z.string().min(1),
  url: z.string().url()
});

export const vehicleSchema = z.object({
  cargo_capacity: z.string().min(1),
  consumables: z.string().min(1),
  cost_in_credits: z.string().min(1),
  created: z.string().min(1),
  crew: z.string().min(1),
  edited: z.string().min(1),
  films: z.array(z.string().url()),
  length: z.string().min(1),
  manufacturer: z.string().min(1),
  max_atmosphering_speed: z.string().min(1),
  model: z.string().min(1),
  name: z.string().min(1),
  passengers: z.string().min(1),
  pilots: z.array(z.string().url()),
  url: z.string().url(),
  vehicle_class: z.string().min(1)
});
