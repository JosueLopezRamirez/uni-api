import { Test, TestingModule } from '@nestjs/testing';
import { FacturaItemController } from './factura-item.controller';
import { FacturaItemService } from './factura-item.service';

describe('FacturaItemController', () => {
  let controller: FacturaItemController;

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      controllers: [FacturaItemController],
      providers: [FacturaItemService],
    }).compile();

    controller = module.get<FacturaItemController>(FacturaItemController);
  });

  it('should be defined', () => {
    expect(controller).toBeDefined();
  });
});
