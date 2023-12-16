import { ObjectType, Field, Int } from '@nestjs/graphql';
import { Starship as PrismaStarship } from '@prisma/client';
import { Character } from 'src/characters/entities/character.entity';
import { Film } from 'src/films/entities/film.entity';

@ObjectType()
export class Starship implements PrismaStarship {
  @Field(() => Int)
  id: number;

  @Field()
  name: string;

  @Field()
  model: string;

  @Field()
  starshipClass: string;

  @Field()
  manufacturer: string;

  @Field()
  costInCredits: string;

  @Field()
  length: string;

  @Field()
  crew: string;

  @Field()
  passengers: string;

  @Field()
  maxAtmospheringSpeed: string;

  @Field()
  hyperdriveRating: string;

  @Field()
  mglt: string;

  @Field()
  cargoCapacity: string;

  @Field()
  consumables: string;

  @Field()
  url: string;

  @Field()
  created: string;

  @Field()
  edited: string;

  @Field(() => [Film], { nullable: 'itemsAndList' })
  films: Film[];

  @Field(() => [Character], { nullable: 'itemsAndList' })
  pilots: Character[];
}
