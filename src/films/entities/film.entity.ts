import { ObjectType, Field, Int } from '@nestjs/graphql';
import { Film as PrismaFilm } from '@prisma/client';
import { Character } from 'src/characters/entities/character.entity';
import { Planet } from 'src/planets/entities/planet.entity';
import { Specie } from 'src/species/entities/specie.entity';
import { Starship } from 'src/starships/entities/starship.entity';
import { Vehicle } from 'src/vehicles/entities/vehicle.entity';

@ObjectType()
export class Film implements PrismaFilm {
  @Field(() => Int)
  id: number;

  @Field()
  title: string;

  @Field(() => Int)
  episodeId: number;

  @Field()
  openingCrawl: string;

  @Field()
  director: string;

  @Field()
  producer: string;

  @Field()
  releaseDate: string;

  @Field()
  url: string;

  @Field()
  created: string;

  @Field()
  edited: string;

  @Field(() => [Specie], { nullable: 'itemsAndList' })
  species: Specie[];

  @Field(() => [Starship], { nullable: 'itemsAndList' })
  starships: Starship[];

  @Field(() => [Vehicle], { nullable: 'itemsAndList' })
  vehicles: Vehicle[];

  @Field(() => [Character], { nullable: 'itemsAndList' })
  characters: Character[];

  @Field(() => [Planet], { nullable: 'itemsAndList' })
  planets: Planet[];
}
