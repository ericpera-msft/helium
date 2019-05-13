import { registerDecorator, ValidationArguments, ValidationOptions } from "class-validator";

// Custom decorator that compares two properties in an object instance
export function IsEqualToProperty(
    property: string,
    condition?: (value: any) => any,
    validationOptions?: ValidationOptions) {
    return (object: object, propertyName: string) => {
        registerDecorator({
            constraints: [property],
            name: "isEqualToProperty",
            options: validationOptions,
            propertyName,
            target: object.constructor,
            validator: {
                validate(value: any, args: ValidationArguments) {
                    const [relatedPropertyName] = args.constraints; // object being validated
                    const relatedValue = (args.object as any)[relatedPropertyName];
                    return typeof value === typeof relatedValue
                        && value === (condition !== undefined ? condition(relatedValue) : relatedValue);
                },
            },
        });
    };
}
