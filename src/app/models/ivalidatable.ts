import { ValidationError } from "class-validator";

export interface IValidatable {
    isValid(): Promise<ValidationError[]>;
}
