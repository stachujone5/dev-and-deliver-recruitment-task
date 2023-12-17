import { Test, TestingModule } from '@nestjs/testing';
import { SpeciesService } from './species.service';
import { PrismaService } from '../prisma/prisma.service';

describe('SpeciesService', () => {
  let speciesService: SpeciesService;

  const mockPrismaService = {
    species: {
      findMany: jest.fn(),
      findUnique: jest.fn()
    }
  };

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      providers: [
        SpeciesService,
        {
          provide: PrismaService,
          useValue: mockPrismaService
        }
      ]
    }).compile();

    speciesService = module.get<SpeciesService>(SpeciesService);
  });

  it('should be defined', () => {
    expect(speciesService).toBeDefined();
  });

  describe('findAll', () => {
    it('should return an array of species', async () => {
      const expectedSpecies = [{ id: 1, name: 'Species 1' }];
      mockPrismaService.species.findMany.mockResolvedValue(expectedSpecies);

      const result = await speciesService.findAll();

      expect(result).toEqual(expectedSpecies);
    });

    it('should return filtered species when name is provided', async () => {
      const expectedSpecies = [{ id: 1, name: 'Species 1' }];
      const name = 'Species';
      mockPrismaService.species.findMany.mockResolvedValue(expectedSpecies);

      const result = await speciesService.findAll(0, 10, name);

      expect(result).toEqual(expectedSpecies);
      expect(mockPrismaService.species.findMany).toHaveBeenCalledWith({
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
    it('should return a single species', async () => {
      const expectedSpecies = { id: 1, name: 'Species 1' };
      const speciesId = 1;
      mockPrismaService.species.findUnique.mockResolvedValue(expectedSpecies);

      const result = await speciesService.findOne(speciesId);

      expect(result).toEqual(expectedSpecies);
      expect(mockPrismaService.species.findUnique).toHaveBeenCalledWith({
        where: { id: speciesId }
      });
    });
  });
});
