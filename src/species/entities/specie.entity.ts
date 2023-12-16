import { ObjectType, Field, Int } from '@nestjs/graphql';
import { Species as PrismaSpecie } from '@prisma/client';
import { Character } from 'src/characters/entities/character.entity';
import { Film } from 'src/films/entities/film.entity';
import { Planet } from 'src/planets/entities/planet.entity';

@ObjectType()
export class Specie implements PrismaSpecie {
  @Field(() => Int)
  id: number;

  @Field()
  name: string;

  @Field()
  classification: string;

  @Field()
  designation: string;

  @Field()
  averageHeight: string;

  @Field()
  averageLifespan: string;

  @Field()
  eyeColors: string;

  @Field()
  hairColors: string;

  @Field()
  skinColors: string;

  @Field()
  language: string;

  @Field()
  url: string;

  @Field()
  created: string;

  @Field()
  edited: string;

  @Field(() => Int)
  planetId: number;

  @Field(() => [Character], { nullable: 'itemsAndList' })
  people: Character[];

  @Field(() => [Film], { nullable: 'itemsAndList' })
  films: Film[];

  @Field(() => Planet, { nullable: true })
  homeworld?: Planet;
}
