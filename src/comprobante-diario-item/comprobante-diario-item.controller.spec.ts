import { Test, TestingModule } from '@nestjs/testing';
import { ComprobanteDiarioItemController } from './comprobante-diario-item.controller';
import { ComprobanteDiarioItemService } from './comprobante-diario-item.service';

describe('ComprobanteDiarioItemController', () => {
  let controller: ComprobanteDiarioItemController;

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      controllers: [ComprobanteDiarioItemController],
      providers: [ComprobanteDiarioItemService],
    }).compile();

    controller = module.get<ComprobanteDiarioItemController>(ComprobanteDiarioItemController);
  });

  it('should be defined', () => {
    expect(controller).toBeDefined();
  });
});
