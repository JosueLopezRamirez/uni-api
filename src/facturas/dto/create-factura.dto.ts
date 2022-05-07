import { CreateFacturaItemDto } from 'src/factura-item/dto/create-factura-item.dto';

export class CreateFacturaDto {
  nombre: string;
  fecha: string;
  empresaId: string;
}

export class DetalleFacturaDto {
  factura: CreateFacturaDto;
  facturaItems: CreateFacturaItemDto[];
}
