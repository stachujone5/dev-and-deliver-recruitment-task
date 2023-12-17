import { Test, TestingModule } from '@nestjs/testing';
import { StarshipsService } from './starships.service';
import { PrismaService } from '../prisma/prisma.service';

describe('StarshipsService', () => {
  let starshipsService: StarshipsService;

  const mockPrismaService = {
    starship: {
      findMany: jest.fn(),
      findUnique: jest.fn()
    }
  };

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      providers: [
        StarshipsService,
        {
          provide: PrismaService,
          useValue: mockPrismaService
        }
      ]
    }).compile();

    starshipsService = module.get<StarshipsService>(StarshipsService);
  });

  it('should be defined', () => {
    expect(starshipsService).toBeDefined();
  });

  describe('findAll', () => {
    it('should return an array of starships', async () => {
      const expectedStarships = [{ id: 1, name: 'Starship 1' }];
      mockPrismaService.starship.findMany.mockResolvedValue(expectedStarships);

      const result = await starshipsService.findAll();

      expect(result).toEqual(expectedStarships);
    });

    it('should return filtered starships when name is provided', async () => {
      const expectedStarships = [{ id: 1, name: 'Starship 1' }];
      const name = 'Starship';
      mockPrismaService.starship.findMany.mockResolvedValue(expectedStarships);

      const result = await starshipsService.findAll(0, 10, name);

      expect(result).toEqual(expectedStarships);
      expect(mockPrismaService.starship.findMany).toHaveBeenCalledWith({
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
    it('should return a single starship', async () => {
      const expectedStarship = { id: 1, name: 'Starship 1' };
      const starshipId = 1;
      mockPrismaService.starship.findUnique.mockResolvedValue(expectedStarship);

      const result = await starshipsService.findOne(starshipId);

      expect(result).toEqual(expectedStarship);
      expect(mockPrismaService.starship.findUnique).toHaveBeenCalledWith({
        where: { id: starshipId }
      });
    });
  });
});
