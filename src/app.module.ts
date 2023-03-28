import { Module } from '@nestjs/common';
import { ConfigModule } from '@nestjs/config';
import { TypeOrmModule } from '@nestjs/typeorm';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { EmpresasModule } from './empresas/empresas.module';
import { ComprobanteDiarioModule } from './comprobante-diario/comprobante-diario.module';
import { FacturasModule } from './facturas/facturas.module';
import { UsuarioModule } from './usuario/usuario.module';
import { AutenticacionModule } from './autenticacion/autenticacion.module';
import { RolesModule } from './roles/roles.module';
import { ThrottlerModule } from '@nestjs/throttler';
import { ComprobanteDiarioItemModule } from './comprobante-diario-item/comprobante-diario-item.module';
import { FacturaItemModule } from './factura-item/factura-item.module';
import { DocumentoModule } from './documento/documento.module';
import { EstaticosModule } from './estaticos/estaticos.module';
import { DinamicosModule } from './dinamicos/dinamicos.module';
import { FilasModule } from './filas/filas.module';
import { HistorialComprobanteDiarioModule } from './historial-comprobante-diario/historial-comprobante-diario.module';
import { HistorialFacturasModule } from './historial-facturas/historial-facturas.module';
import { PermisosModule } from './permisos/permisos.module';
import { PlantillasModule } from './plantillas/plantillas.module';
import { typeOrmAsyncConfig } from './config/typeorm.config';
import { SharedModule } from './shared/shared.module';
import { AwsModule } from './aws/aws.module';

@Module({
  imports: [
    ConfigModule.forRoot(),
    TypeOrmModule.forRootAsync(typeOrmAsyncConfig),
    ThrottlerModule.forRoot({
      ttl: 60,
      limit: 10,
    }),
    EmpresasModule,
    ComprobanteDiarioModule,
    FacturasModule,
    UsuarioModule,
    AutenticacionModule,
    RolesModule,
    ComprobanteDiarioItemModule,
    FacturaItemModule,
    DocumentoModule,
    EstaticosModule,
    DinamicosModule,
    FilasModule,
    HistorialComprobanteDiarioModule,
    HistorialFacturasModule,
    PermisosModule,
    PlantillasModule,
    SharedModule,
    AwsModule,
  ],
  controllers: [AppController],
  providers: [AppService],
})
export class AppModule {}
