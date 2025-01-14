// 
// SeasonalPatcher.ts
//

export default class SeasonalPatcher {

    public static readonly YEAR_TICKS: number = 8760000;

    public static getSeasonalIndex(tick: number): number {
        let abjustedIndex: number = Math.abs(tick - 744000) % SeasonalPatcher.YEAR_TICKS;
        let yearPerc: number = Math.abs((abjustedIndex * 200 / SeasonalPatcher.YEAR_TICKS) - 100);
        return Math.floor(yearPerc);       
    }

}
