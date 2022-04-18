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

@Module({
  imports: [
    ConfigModule.forRoot(),
    TypeOrmModule.forRoot({
      type: 'mysql',
      host: process.env.DATABASE_HOST,
      port: parseInt(process.env.DATABASE_PORT, 10),
      username: process.env.DATABASE_USERNAME,
      password: process.env.DATABASE_PASSWORD,
      database: process.env.DATABASE_NAME,
      autoLoadEntities: true,
      dropSchema: true,
      synchronize: true,
      logging: true,
    }),
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
  ],
  controllers: [AppController],
  providers: [AppService],
})
export class AppModule {}
