import { Test, TestingModule } from '@nestjs/testing';
import { PlanetsService } from './planets.service';
import { PrismaService } from '../prisma/prisma.service';

describe('PlanetsService', () => {
  let planetsService: PlanetsService;

  const mockPrismaService = {
    planet: {
      findMany: jest.fn(),
      findUnique: jest.fn()
    }
  };

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      providers: [
        PlanetsService,
        {
          provide: PrismaService,
          useValue: mockPrismaService
        }
      ]
    }).compile();

    planetsService = module.get<PlanetsService>(PlanetsService);
  });

  it('should be defined', () => {
    expect(planetsService).toBeDefined();
  });

  describe('findAll', () => {
    it('should return an array of planets', async () => {
      const expectedPlanets = [{ id: 1, name: 'Planet 1' }];
      mockPrismaService.planet.findMany.mockResolvedValue(expectedPlanets);

      const result = await planetsService.findAll();

      expect(result).toEqual(expectedPlanets);
    });

    it('should return filtered planets when name is provided', async () => {
      const expectedPlanets = [{ id: 1, name: 'Planet 1' }];
      const name = 'Planet';
      mockPrismaService.planet.findMany.mockResolvedValue(expectedPlanets);

      const result = await planetsService.findAll(0, 10, name);

      expect(result).toEqual(expectedPlanets);
      expect(mockPrismaService.planet.findMany).toHaveBeenCalledWith({
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
    it('should return a single planet', async () => {
      const expectedPlanet = { id: 1, name: 'Planet 1' };
      const planetId = 1;
      mockPrismaService.planet.findUnique.mockResolvedValue(expectedPlanet);

      const result = await planetsService.findOne(planetId);

      expect(result).toEqual(expectedPlanet);
      expect(mockPrismaService.planet.findUnique).toHaveBeenCalledWith({
        where: { id: planetId }
      });
    });
  });
});
