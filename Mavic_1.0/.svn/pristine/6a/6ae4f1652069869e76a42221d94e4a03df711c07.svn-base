//
//  ResultView.m
//  Mavic
//
//  Created by XiaoQiang on 2017/4/28.
//  Copyright © 2017年 LoHas-Tech. All rights reserved.
//

#import "ResultView.h"
#import "YYKit.h"
@implementation ResultView

- (void)awakeFromNib {
    [super awakeFromNib];
    
    [self setUpChartsView];
    
    _currentResultContainer.layer.cornerRadius  = 8.0;
    _currentResultContainer.layer.masksToBounds = YES;
    _currentResultContainer.clipsToBounds       = NO;
    _currentResultContainer.layer.borderColor   = UIColorHex(cccccc).CGColor;
    _currentResultContainer.layer.shadowColor   = UIColorHex(000000).CGColor;
    _currentResultContainer.layer.shadowOffset  = CGSizeMake(0, 2);
    _currentResultContainer.layer.shadowRadius  = 1;
    _currentResultContainer.layer.shadowOpacity = 0.09;
    
    _historyResultContainer.layer.cornerRadius  = 8.0;
    _historyResultContainer.layer.masksToBounds = YES;
    _historyResultContainer.clipsToBounds       = NO;
    _historyResultContainer.layer.borderColor   = UIColorHex(cccccc).CGColor;
    _historyResultContainer.layer.shadowColor   = UIColorHex(000000).CGColor;
    _historyResultContainer.layer.shadowOffset  = CGSizeMake(0, 2);
    _historyResultContainer.layer.shadowRadius  = 1;
    _historyResultContainer.layer.shadowOpacity = 0.09;
    
    
    _currentSignalQualityContainer.layer.cornerRadius  = 8.0;
    _currentSignalQualityContainer.layer.masksToBounds = YES;
    _currentSignalQualityContainer.clipsToBounds       = NO;
    _currentSignalQualityContainer.layer.borderColor   = UIColorHex(cccccc).CGColor;
    _currentSignalQualityContainer.layer.shadowColor   = UIColorHex(000000).CGColor;
    _currentSignalQualityContainer.layer.shadowOffset  = CGSizeMake(0, 2);
    _currentSignalQualityContainer.layer.shadowRadius  = 1;
    _currentSignalQualityContainer.layer.shadowOpacity = 0.09;
    
    _currentInfoContainer.layer.cornerRadius  = 8.0;
    _currentInfoContainer.layer.masksToBounds = YES;
    _currentInfoContainer.clipsToBounds       = NO;
    _currentInfoContainer.layer.borderColor   = UIColorHex(cccccc).CGColor;
    _currentInfoContainer.layer.shadowColor   = UIColorHex(000000).CGColor;
    _currentInfoContainer.layer.shadowOffset  = CGSizeMake(0, 2);
    _currentInfoContainer.layer.shadowRadius  = 1;
    _currentInfoContainer.layer.shadowOpacity = 0.09;
    
    
}

- (void)setUpChartsView {
    CGRect rect = CGRectMake(20, 60, 588, 210);
    _historyCharts = [[WKEchartsView alloc] initWithFrame:rect];
    [self.historyResultContainer addSubview:_historyCharts];
    PYOption *option = [self stackedAreaOption];
    [_historyCharts setOption:option];
    [_historyCharts loadEcharts];
    
}

- (PYOption *)stackedAreaOption {
    return [PYOption initPYOptionWithBlock:^(PYOption *option) {
        option.tooltipEqual([PYTooltip initPYTooltipWithBlock:^(PYTooltip *tooltip) {
            tooltip.triggerEqual(PYTooltipTriggerAxis);
        }])
        .colorEqual(@[@"#007aff",@"#32d250"])
        /*
         ** 折现区分
        .legendEqual([PYLegend initPYLegendWithBlock:^(PYLegend *legend) {
            legend.dataEqual(@[@"左躯干",@"右躯干"]);
        }])
         */
        .gridEqual([PYGrid initPYGridWithBlock:^(PYGrid *grid) {
            grid.xEqual(@40).x2Equal(@20);
            grid.yEqual(@10).y2Equal(@40);
        }])
        .toolboxEqual([PYToolbox initPYToolboxWithBlock:^(PYToolbox *toolbox) {
            toolbox.showEqual(NO)
            .featureEqual([PYToolboxFeature initPYToolboxFeatureWithBlock:^(PYToolboxFeature *feature) {
                feature.markEqual([PYToolboxFeatureMark initPYToolboxFeatureMarkWithBlock:^(PYToolboxFeatureMark *mark) {
                    mark.showEqual(YES);
                }])
                .dataViewEqual([PYToolboxFeatureDataView initPYToolboxFeatureDataViewWithBlock:^(PYToolboxFeatureDataView *dataView) {
                    dataView.showEqual(YES).readOnlyEqual(NO);
                }])
                .magicTypeEqual([PYToolboxFeatureMagicType initPYToolboxFeatureMagicTypeWithBlock:^(PYToolboxFeatureMagicType *magicType) {
                    magicType.showEqual(YES).typeEqual(@[PYSeriesTypeLine, PYSeriesTypeBar, @"stack", @"tiled"]);
                }])
                .restoreEqual([PYToolboxFeatureRestore initPYToolboxFeatureRestoreWithBlock:^(PYToolboxFeatureRestore *restore) {
                    restore.showEqual(YES);
                }]);
            }]);
        }])
        .calculableEqual(YES)
        .addXAxis([PYAxis initPYAxisWithBlock:^(PYAxis *axis) {
            axis.typeEqual(PYAxisTypeCategory)
            .boundaryGapEqual(@NO).addDataArr(@[@"1月",@"2月",@"3月",@"4月",@"5月",@"6月",@"7月",@"8月",@"9月",@"10月",@"11月",@"12月"]);
        }])
        .addYAxis([PYAxis initPYAxisWithBlock:^(PYAxis *axis) {
            axis.typeEqual(PYAxisTypeValue);
        }])
        .addSeries([PYCartesianSeries initPYCartesianSeriesWithBlock:^(PYCartesianSeries *series) {
//            series.stackEqual(@"总量")
            series.nameEqual(@"左躯干")
            .typeEqual(PYSeriesTypeLine)
            .itemStyleEqual([PYItemStyle initPYItemStyleWithBlock:^(PYItemStyle *itemStyle) {
                itemStyle.normalEqual([PYItemStyleProp initPYItemStylePropWithBlock:^(PYItemStyleProp *normal) {
                    normal.areaStyleEqual([PYAreaStyle initPYAreaStyleWithBlock:^(PYAreaStyle *areaStyle) {
                        areaStyle.typeEqual(PYAreaStyleTypeDefault);
                    }]);
                }]);
            }])
            .dataEqual(@[@(1100),@(1200),@(1150),@(1350),@(1400),@(1780), @(1600), @(1650),@(1450)]);
        }])
        .addSeries([PYCartesianSeries initPYCartesianSeriesWithBlock:^(PYCartesianSeries *series) {
//            series.stackEqual(@"总量")
            series.nameEqual(@"右躯干")
            .typeEqual(PYSeriesTypeLine)
            .itemStyleEqual([PYItemStyle initPYItemStyleWithBlock:^(PYItemStyle *itemStyle) {
                itemStyle.normalEqual([PYItemStyleProp initPYItemStylePropWithBlock:^(PYItemStyleProp *normal) {
                    normal.areaStyleEqual([PYAreaStyle initPYAreaStyleWithBlock:^(PYAreaStyle *areaStyle) {
                        areaStyle.typeEqual(PYAreaStyleTypeDefault);
                    }]);
                }]);
            }])
            .dataEqual(@[@(1220), @(1350), @(1200), @(1500), @(1300),@(1700),@(1700),@(1800), @(1550)]);
        }]);
    }];

}

@end
