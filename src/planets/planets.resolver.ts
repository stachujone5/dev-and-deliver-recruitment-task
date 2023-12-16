import { Resolver, Query, Args, Int } from '@nestjs/graphql';
import { PositiveIntPipe } from 'src/pipes';
import { PlanetsService } from './planets.service';
import { Planet } from './entities/planet.entity';

@Resolver(() => Planet)
export class PlanetsResolver {
  constructor(private readonly planetsService: PlanetsService) {}

  @Query(() => [Planet], { description: 'Get a list of planets' })
  async planets(
    @Args('skip', { type: () => Int, defaultValue: 0 }, PositiveIntPipe) skip: number,
    @Args('take', { type: () => Int, defaultValue: 10 }, PositiveIntPipe) take: number,
    @Args('name', { nullable: true, description: 'Filter planets by name' })
    name?: string
  ) {
    return this.planetsService.findAll(skip, take, name);
  }

  @Query(() => Planet, { nullable: true, description: 'Get a planet by ID' })
  async planet(
    @Args('id', { type: () => Int, description: 'Planet ID' }, PositiveIntPipe) id: number
  ) {
    return this.planetsService.findOne(id);
  }
}
