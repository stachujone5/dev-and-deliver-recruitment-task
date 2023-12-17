import { BadRequestException } from '@nestjs/common';
import { PositiveIntPipe } from './pipes';

describe('PositiveIntPipe', () => {
  let pipe: PositiveIntPipe;

  beforeEach(() => {
    pipe = new PositiveIntPipe();
  });

  it('should be defined', () => {
    expect(pipe).toBeDefined();
  });

  it('should transform a positive integer without throwing an exception', () => {
    const value = 42;
    const result = pipe.transform(value);
    expect(result).toBe(value);
  });

  it('should throw a BadRequestException for a non-integer value', () => {
    const value = 42.5;
    expect(() => pipe.transform(value)).toThrowError(BadRequestException);
  });

  it('should throw a BadRequestException for a negative integer value', () => {
    const value = -42;
    expect(() => pipe.transform(value)).toThrowError(BadRequestException);
  });
});
