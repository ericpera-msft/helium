import {
    Equals, IsAlphanumeric, IsLowercase, IsNotEmpty, NotEquals, validate, ValidateIf,
} from "class-validator";
import { IsEqualToProperty } from "../../utilities/validationUtilities";
import { Actor } from "./actor";
import { IValidatable } from "./ivalidatable";

export class Movie implements IValidatable {

    @IsNotEmpty()
    @IsAlphanumeric()
    public id: string;

    @IsNotEmpty()
    @IsAlphanumeric()
    public movieId: string;

    @ValidateIf((x) => x.title !== undefined)
    @IsEqualToProperty("title", (x) => (x as string).toLowerCase(),
        {
            message: "textSearch must equal the lowercase version of 'title'",
        })
    @IsLowercase()
    public textSearch: string;

    @IsNotEmpty()
    @NotEquals((x) => x.trim.length() > 0)
    public title: string;

    @Equals("Movie")
    public type: string;

    constructor(
        id: string,
        movieId: string,
        title: string,
        textSearch: string,
        public key?: number,
        public year?: number,
        public rating?: number,
        public votes?: number,
        public genres?: string[],
        public roles?: Actor[]) {
        this.id = id;
        this.movieId = movieId;
        this.title = title;
        this.textSearch = textSearch;
        this.type = "Movie";
        this.key = key;
        this.year = year;
        this.rating = rating;
        this.votes = votes;
        this.genres = genres;
        this.roles = roles;
    }

    public isValid() {
        return validate(this);
    }
}
