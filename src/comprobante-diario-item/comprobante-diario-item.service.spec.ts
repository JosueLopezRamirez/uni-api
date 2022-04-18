import { Test, TestingModule } from '@nestjs/testing';
import { ComprobanteDiarioItemService } from './comprobante-diario-item.service';

describe('ComprobanteDiarioItemService', () => {
  let service: ComprobanteDiarioItemService;

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      providers: [ComprobanteDiarioItemService],
    }).compile();

    service = module.get<ComprobanteDiarioItemService>(ComprobanteDiarioItemService);
  });

  it('should be defined', () => {
    expect(service).toBeDefined();
  });
});
