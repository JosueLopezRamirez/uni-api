import { Test, TestingModule } from '@nestjs/testing';
import { FacturaItemService } from './factura-item.service';

describe('FacturaItemService', () => {
  let service: FacturaItemService;

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      providers: [FacturaItemService],
    }).compile();

    service = module.get<FacturaItemService>(FacturaItemService);
  });

  it('should be defined', () => {
    expect(service).toBeDefined();
  });
});
