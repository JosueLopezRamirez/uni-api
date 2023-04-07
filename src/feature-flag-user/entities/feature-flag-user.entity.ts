import { BaseEntity } from "../../utils/base.entity";
import { Column, Entity, ManyToOne } from "typeorm";
import { FeatureFlag } from "../../feature-flag/entities/feature-flag.entity";
import { Usuario } from "../../usuario/entities/usuario.entity";

@Entity()
export class FeatureFlagUser extends BaseEntity {

    @Column({ name: 'usuarioId' })
    usuarioId: string;

    @Column({ name: 'featureFlagId' })
    featureFlagId: string;

    @ManyToOne(() => Usuario, (entity) => entity.featureFlagUser)
    usuario: Usuario;

    @ManyToOne(() => FeatureFlag, (entity) => entity.featureFlagUser)
    featureFlag: FeatureFlag;

}
