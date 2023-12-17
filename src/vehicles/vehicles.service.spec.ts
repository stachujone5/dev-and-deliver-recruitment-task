import { Test, TestingModule } from '@nestjs/testing';
import { VehiclesService } from './vehicles.service';
import { PrismaService } from '../prisma/prisma.service';

describe('VehiclesService', () => {
  let vehiclesService: VehiclesService;

  const mockPrismaService = {
    vehicle: {
      findMany: jest.fn(),
      findUnique: jest.fn()
    }
  };

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      providers: [
        VehiclesService,
        {
          provide: PrismaService,
          useValue: mockPrismaService
        }
      ]
    }).compile();

    vehiclesService = module.get<VehiclesService>(VehiclesService);
  });

  it('should be defined', () => {
    expect(vehiclesService).toBeDefined();
  });

  describe('findAll', () => {
    it('should return an array of vehicles', async () => {
      const expectedVehicles = [{ id: 1, name: 'Vehicle 1' }];
      mockPrismaService.vehicle.findMany.mockResolvedValue(expectedVehicles);

      const result = await vehiclesService.findAll();

      expect(result).toEqual(expectedVehicles);
    });

    it('should return filtered vehicles when name is provided', async () => {
      const expectedVehicles = [{ id: 1, name: 'Vehicle 1' }];
      const name = 'Vehicle';
      mockPrismaService.vehicle.findMany.mockResolvedValue(expectedVehicles);

      const result = await vehiclesService.findAll(0, 10, name);

      expect(result).toEqual(expectedVehicles);
      expect(mockPrismaService.vehicle.findMany).toHaveBeenCalledWith({
        where: {
          name: {
            contains: name,
            mode: 'insensitive'
          }
        },
        skip: 0,
        take: 10
      });
    });
  });

  describe('findOne', () => {
    it('should return a single vehicle', async () => {
      const expectedVehicle = { id: 1, name: 'Vehicle 1' };
      const vehicleId = 1;
      mockPrismaService.vehicle.findUnique.mockResolvedValue(expectedVehicle);

      const result = await vehiclesService.findOne(vehicleId);

      expect(result).toEqual(expectedVehicle);
      expect(mockPrismaService.vehicle.findUnique).toHaveBeenCalledWith({
        where: { id: vehicleId }
      });
    });
  });
});
