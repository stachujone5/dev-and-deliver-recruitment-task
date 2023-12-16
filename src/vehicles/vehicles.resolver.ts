import { Resolver, Query, Args, Int } from '@nestjs/graphql';
import { PositiveIntPipe } from 'src/pipes';
import { VehiclesService } from './vehicles.service';
import { Vehicle } from './entities/vehicle.entity';

@Resolver(() => Vehicle)
export class VehiclesResolver {
  constructor(private readonly vehiclesService: VehiclesService) {}

  @Query(() => [Vehicle], { description: 'Get a list of vehicles' })
  async vehicles(
    @Args('skip', { type: () => Int, defaultValue: 0 }, PositiveIntPipe) skip: number,
    @Args('take', { type: () => Int, defaultValue: 10 }, PositiveIntPipe) take: number,
    @Args('name', { nullable: true, description: 'Filter vehicles by name' })
    name?: string
  ) {
    return this.vehiclesService.findAll(skip, take, name);
  }

  @Query(() => Vehicle, { nullable: true, description: 'Get a vehicle by ID' })
  async vehicle(
    @Args('id', { type: () => Int, description: 'Vehicle ID' }, PositiveIntPipe) id: number
  ) {
    return this.vehiclesService.findOne(id);
  }
}
