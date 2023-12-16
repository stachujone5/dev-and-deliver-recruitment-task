import { Resolver, Query, Args, Int } from '@nestjs/graphql';
import { FilmsService } from './films.service';
import { Film } from './entities/film.entity';
import { PositiveIntPipe } from 'src/pipes';

@Resolver(() => Film)
export class FilmsResolver {
  constructor(private readonly filmsService: FilmsService) {}

  @Query(() => [Film], { description: 'Get a list of films' })
  async films(
    @Args('skip', { type: () => Int, defaultValue: 0 }, PositiveIntPipe) skip: number,
    @Args('take', { type: () => Int, defaultValue: 10 }, PositiveIntPipe) take: number,
    @Args('title', { nullable: true, description: 'Filter films by title' })
    title?: string
  ) {
    return this.filmsService.findAll(skip, take, title);
  }

  @Query(() => Film, { nullable: true, description: 'Get a film by ID' })
  async film(@Args('id', { type: () => Int, description: 'Film ID' }, PositiveIntPipe) id: number) {
    return this.filmsService.findOne(id);
  }
}
