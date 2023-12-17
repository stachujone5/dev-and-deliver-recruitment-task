import { ObjectType, Field, Int } from '@nestjs/graphql';
import { Film as PrismaFilm } from '@prisma/client';

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
}
