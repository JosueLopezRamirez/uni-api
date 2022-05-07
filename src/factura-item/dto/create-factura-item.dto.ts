export class CreateFacturaItemDto {
  numeroFactura: string;
  descripcion: string;
  ventasExoneradas: number;
  ventasExentas: number;
  ventasGrabadas: number;
  facturaId: string;
  isNewRow?: boolean;
  id?: string;
}
