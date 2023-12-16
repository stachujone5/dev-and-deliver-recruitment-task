import { Injectable } from '@nestjs/common';
import { Prisma } from '@prisma/client';
import { PrismaService } from 'src/prisma/prisma.service';

@Injectable()
export class PlanetsService {
  constructor(private prisma: PrismaService) {}

  async findAll(skip = 0, take = 10, name?: string) {
    const where: Prisma.PlanetWhereInput = {};

    if (name) {
      where.name = {
        contains: name,
        mode: 'insensitive'
      };
    }

    return this.prisma.planet.findMany({
      where,
      include: {
        films: true,
        residents: true,
        species: true
      },
      skip,
      take
    });
  }

  async findOne(id: number) {
    return this.prisma.planet.findUnique({
      where: { id },
      include: {
        films: true,
        residents: true,
        species: true
      }
    });
  }
}
