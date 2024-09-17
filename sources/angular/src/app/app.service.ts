import { Injectable, signal, WritableSignal } from "@angular/core";

import { sleep } from "../esm/sleep";

@Injectable({
  providedIn: "root",
})
export class AppService {
  public readonly name: string = "Aoi Hitomi Engine";
  public readonly runtimeIsPython: WritableSignal<boolean> = signal(false);

  constructor() {
    this.checkPythonRuntimeOrNot().then((runtimeOrNot: boolean) =>
      this.runtimeIsPython.set(runtimeOrNot),
    );
  }

  private readonly checkPythonRuntimeOrNot = async (): Promise<boolean> => {
    while (!window.pywebview) await sleep(1000);
    return true;
  };
}
