import { Injectable } from '@nestjs/common';
import { Prisma } from '@prisma/client';
import { PrismaService } from 'src/prisma/prisma.service';

@Injectable()
export class StarshipsService {
  constructor(private prisma: PrismaService) {}

  async findAll(skip = 0, take = 10, name?: string) {
    const where: Prisma.StarshipWhereInput = {};

    if (name) {
      where.name = {
        contains: name,
        mode: 'insensitive'
      };
    }

    return this.prisma.starship.findMany({
      where,
      skip,
      take
    });
  }

  async findOne(id: number) {
    return this.prisma.starship.findUnique({
      where: { id }
    });
  }
}
