import { ObjectType, Field, Int } from '@nestjs/graphql';
import { Species as PrismaSpecie } from '@prisma/client';

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
}
