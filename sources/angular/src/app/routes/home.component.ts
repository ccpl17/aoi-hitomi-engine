import { Component, inject } from "@angular/core";

import { AppService } from "../app.service";

@Component({
  selector: "route-home",
  standalone: true,
  template: `
    <div class="flex justify-center items-center p-4 h-full">
      <div class="flex flex-col gap-3 justify-start">
        <a
          title="https://github.com/ccpl17/aoi-hitomi-engine"
          href="https://github.com/ccpl17/aoi-hitomi-engine"
          target="_blank"
          class="underline underline-offset-8 font-bold"
          >{{ app.name }}</a
        >

        <p>
          Designed by
          <a
            title="https://github.com/ccpl17"
            href="https://github.com/ccpl17"
            target="_blank"
            class="underline underline-offset-8"
            >Cenlun Chung Po Lun</a
          >
        </p>

        <p class="flex gap-2 items-center">
          Powered by
          <a
            title="https://angular.dev/"
            href="https://angular.dev/"
            target="_blank"
            class="px-2 py-1 bg-secondary font-bold text-primary rounded"
            >Angular</a
          >
        </p>
      </div>
    </div>
  `,
})
export class HomeComponent {
  protected readonly app: AppService = inject(AppService);
}
