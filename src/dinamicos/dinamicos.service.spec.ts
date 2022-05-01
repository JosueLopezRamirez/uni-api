import { Test, TestingModule } from '@nestjs/testing';
import { DinamicosService } from './dinamicos.service';

describe('DinamicosService', () => {
  let service: DinamicosService;

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      providers: [DinamicosService],
    }).compile();

    service = module.get<DinamicosService>(DinamicosService);
  });

  it('should be defined', () => {
    expect(service).toBeDefined();
  });
});
