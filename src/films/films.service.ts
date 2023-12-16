import { Injectable } from '@nestjs/common';
import { Prisma } from '@prisma/client';
import { PrismaService } from 'src/prisma/prisma.service';

@Injectable()
export class FilmsService {
  constructor(private prisma: PrismaService) {}

  async findAll(skip = 0, take = 10, title?: string) {
    const where: Prisma.FilmWhereInput = {};

    if (title) {
      where.title = {
        contains: title,
        mode: 'insensitive'
      };
    }

    return this.prisma.film.findMany({
      where,
      include: {
        species: true,
        starships: true,
        vehicles: true,
        characters: true,
        planets: true
      },
      skip,
      take
    });
  }

  async findOne(id: number) {
    return this.prisma.film.findUnique({
      where: { id },
      include: {
        species: true,
        starships: true,
        vehicles: true,
        characters: true,
        planets: true
      }
    });
  }
}
