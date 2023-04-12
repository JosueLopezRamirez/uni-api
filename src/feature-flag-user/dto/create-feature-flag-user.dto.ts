import { IsNotEmpty, IsString } from "class-validator";

export class CreateFeatureFlagUserDto {
    @IsString()
    @IsNotEmpty()
    usuarioId: string;

    @IsString()
    @IsNotEmpty()
    featureFlagId: string;
}

export class BulkFeatureUserDto {
    featureFlagIds: string[];
    usuarioId: string;
}
