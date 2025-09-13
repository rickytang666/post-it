import { setTimeout, clearTimeout } from "./debounce";

export async function delay(seconds: number): Promise<void> {
  return new Promise<void>((resolve, reject) => {
    setTimeout(() => {
      resolve();
    }, seconds * 1000);
  });
}
