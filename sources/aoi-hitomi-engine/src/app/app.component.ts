import { Component, inject } from "@angular/core";
import { RouterOutlet } from "@angular/router";

import { AppService } from "./app.service";
import { AppLayoutDirective } from "./app.layout.directive";
import { NavComponent } from "./components/nav/nav.component";

@Component({
  selector: "app-root",
  standalone: true,
  imports: [RouterOutlet, AppLayoutDirective, NavComponent],
  template: `
    @if (app.runtimeIsPython()) {
      <div app-layout>
        <div class="overflow-auto">
          <router-outlet />
        </div>

        <app-nav class="p-2" />
      </div>
    }
  `,
})
export class AppComponent {
  protected readonly app: AppService = inject(AppService);
}
