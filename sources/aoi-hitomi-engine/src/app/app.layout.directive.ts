import { Directive, HostBinding } from "@angular/core";

@Directive({
  // eslint-disable-next-line @angular-eslint/directive-selector
  selector: "[app-layout]",
  standalone: true,
})
export class AppLayoutDirective {
  private layout = "grid";
  private grid = "grid-cols-1 grid-rows-[minmax(0,_1fr)_4rem]";
  private sizing = "h-full";
  private backgrounds = "bg-primary";

  @HostBinding("class")
  private hostClass =
    `${this.layout} ${this.grid} ${this.sizing} ${this.backgrounds}`;
}
