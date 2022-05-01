import { Test, TestingModule } from '@nestjs/testing';
import { FilasService } from './filas.service';

describe('FilasService', () => {
  let service: FilasService;

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      providers: [FilasService],
    }).compile();

    service = module.get<FilasService>(FilasService);
  });

  it('should be defined', () => {
    expect(service).toBeDefined();
  });
});
