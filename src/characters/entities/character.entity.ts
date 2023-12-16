import { ObjectType, Field, Int } from '@nestjs/graphql';
import { Character as PrismaCharacter } from '@prisma/client';
import { Film } from 'src/films/entities/film.entity';
import { Specie } from 'src/species/entities/specie.entity';
import { Starship } from 'src/starships/entities/starship.entity';
import { Vehicle } from 'src/vehicles/entities/vehicle.entity';

@ObjectType()
export class Character implements PrismaCharacter {
  @Field(() => Int)
  id: number;

  @Field()
  name: string;

  @Field()
  birthYear: string;

  @Field()
  eyeColor: string;

  @Field()
  gender: string;

  @Field()
  hairColor: string;

  @Field()
  height: string;

  @Field()
  mass: string;

  @Field()
  skinColor: string;

  @Field({ nullable: true })
  homeworld: string;

  @Field()
  url: string;

  @Field()
  created: string;

  @Field()
  edited: string;

  @Field(() => Int)
  planetId: number;

  @Field(() => [Film], { nullable: 'itemsAndList' })
  films: Film[];

  @Field(() => [Specie], { nullable: 'itemsAndList' })
  species: Specie[];

  @Field(() => [Starship], { nullable: 'itemsAndList' })
  starships: Starship[];

  @Field(() => [Vehicle], { nullable: 'itemsAndList' })
  vehicles: Vehicle[];
}
