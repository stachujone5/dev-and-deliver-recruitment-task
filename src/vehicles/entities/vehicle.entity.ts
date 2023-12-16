import { ObjectType, Field, Int } from '@nestjs/graphql';
import { Vehicle as PrismaVehicle } from '@prisma/client';
import { Character } from 'src/characters/entities/character.entity';
import { Film } from 'src/films/entities/film.entity';

@ObjectType()
export class Vehicle implements PrismaVehicle {
  @Field(() => Int)
  id: number;

  @Field()
  name: string;

  @Field()
  model: string;

  @Field()
  vehicleClass: string;

  @Field()
  manufacturer: string;

  @Field()
  length: string;

  @Field()
  costInCredits: string;

  @Field()
  crew: string;

  @Field()
  passengers: string;

  @Field()
  maxAtmospheringSpeed: string;

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
