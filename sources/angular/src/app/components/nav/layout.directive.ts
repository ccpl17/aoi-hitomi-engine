import { Directive, HostBinding } from "@angular/core";

@Directive({
  // eslint-disable-next-line @angular-eslint/directive-selector
  selector: "[layout-for-nav]",
  standalone: true,
})
export class LayoutForNavDirective {
  private layout = "grid";
  private grid = "grid-cols-[4.5rem_minmax(0,_1fr)_5rem] gap-2";
  private spacing = "p-2";
  private sizing = "h-full";
  private typography = "text-primary";
  private backgrounds = "bg-secondary";
  private borders = "rounded-lg border-l-8 border-l-accent";
  private effects = "shadow";

  @HostBinding("class")
  private hostClass =
    `${this.layout} ${this.grid} ${this.spacing} ${this.sizing} ${this.typography} ${this.backgrounds} ${this.borders} ${this.effects}`;
}
