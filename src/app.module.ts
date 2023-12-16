import { Module } from '@nestjs/common';
import { GraphQLModule } from '@nestjs/graphql';
import { ApolloDriver, ApolloDriverConfig } from '@nestjs/apollo';
import { join } from 'path';
import { PrismaModule } from './prisma/prisma.module';
import { FilmsModule } from './films/films.module';
import { SwapiModule } from './swapi/swapi.module';
import { PlanetsResolver } from './planets/planets.resolver';
import { PlanetsModule } from './planets/planets.module';

@Module({
  imports: [
    GraphQLModule.forRoot<ApolloDriverConfig>({
      driver: ApolloDriver,
      autoSchemaFile: join(process.cwd(), 'src/schema.gql')
    }),
    PrismaModule,
    SwapiModule,
    FilmsModule,
    PlanetsModule
  ],
  providers: [PlanetsResolver]
})
export class AppModule {}
