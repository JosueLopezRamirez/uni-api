import { Column, Entity, OneToMany } from "typeorm";
import { BaseEntity } from "../../utils/base.entity";
import { FeatureFlagUser } from "../../feature-flag-user/entities/feature-flag-user.entity";

@Entity()
export class FeatureFlag extends BaseEntity {

    @Column()
    name: string;

    @Column()
    active: boolean;

    @OneToMany(() => FeatureFlagUser, (entidad) => entidad.featureFlag)
    featureFlagUser: FeatureFlagUser[]
}