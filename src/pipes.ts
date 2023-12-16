import { PipeTransform, Injectable, BadRequestException } from '@nestjs/common';

@Injectable()
export class PositiveIntPipe implements PipeTransform {
  transform(value: number) {
    if (!Number.isInteger(value) || value < 0) {
      throw new BadRequestException('Value must be a positive integer.');
    }
    return value;
  }
}
