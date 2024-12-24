import { Component, inject } from "@angular/core";
import { NgIconComponent, provideIcons } from "@ng-icons/core";
import {
  heroArrowLeft,
  heroArrowRight,
  heroArrowsPointingIn,
  heroArrowsPointingOut,
  heroBars3,
} from "@ng-icons/heroicons/outline";

import { AppService } from "../../app.service";
import { StateService } from "../../services/state.service";
import { PythonService } from "../../services/python.service";
import { LayoutForNavDirective } from "./layout.directive";
import { ButtonInNavDirective } from "./button.directive";

@Component({
  selector: "app-nav",
  imports: [LayoutForNavDirective, ButtonInNavDirective, NgIconComponent],
  viewProviders: [
    provideIcons({
      heroArrowLeft,
      heroArrowsPointingIn,
      heroArrowsPointingOut,
      heroBars3,
      heroArrowRight,
    }),
  ],
  template: `
    <div layout-for-nav>
      <div class="col-start-1 place-self-start flex gap-2">
        <button button-in-nav title="上一個場景" class="flex items-center">
          <ng-icon name="heroArrowLeft" />
        </button>

        <button
          button-in-nav
          [title]="state.appWindowIsFullscreen() ? '視窗模式' : '全螢幕'"
          (click)="python.toggleAppWindowFullscreen()"
          class="flex items-center"
        >
          @if (state.appWindowIsFullscreen()) {
            <ng-icon name="heroArrowsPointingIn" />
          } @else {
            <ng-icon name="heroArrowsPointingOut" />
          }
        </button>
      </div>

      <div class="col-start-2 place-self-center">
        <div class="flex gap-2 items-center h-full">
          <button button-in-nav title="選單" class="flex items-center">
            <ng-icon name="heroBars3" />
          </button>

          <div class="font-serif text-primary">
            {{ app.name }}
          </div>
        </div>
      </div>

      <div class="col-start-3 place-self-end">
        <button button-in-nav title="下一個場景" class="flex items-center">
          <ng-icon name="heroArrowRight" />
        </button>
      </div>
    </div>
  `,
})
export class NavComponent {
  protected readonly app: AppService = inject(AppService);
  protected readonly state: StateService = inject(StateService);
  protected readonly python: PythonService = inject(PythonService);
}
