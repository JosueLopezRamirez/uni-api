import { Test, TestingModule } from '@nestjs/testing';
import { EstaticosService } from './estaticos.service';

describe('EstaticosService', () => {
  let service: EstaticosService;

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      providers: [EstaticosService],
    }).compile();

    service = module.get<EstaticosService>(EstaticosService);
  });

  it('should be defined', () => {
    expect(service).toBeDefined();
  });
});
