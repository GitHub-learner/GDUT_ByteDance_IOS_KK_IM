#import "MineView.h"
#import "Masonry.h"

@interface MineView()

@property (nonatomic, strong) UILabel* funLabel;

@end

@implementation MineView



// 设置每个row上面的cell，其中indexPath（索引路径）有两个属性:section and row
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSInteger section = indexPath.section;
    NSInteger row = indexPath.row;
    
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"UITableViewCell"];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    UIImageView *imgView = [[UIImageView alloc]init];
    [cell.contentView addSubview:imgView];
    [imgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(cell.contentView);
        make.left.equalTo(cell.contentView).offset(20);
        make.width.height.equalTo(@30);
    }];
    
    self.funLabel = [[UILabel alloc]init];
    self.funLabel.userInteractionEnabled = NO;
    [cell.contentView addSubview:self.funLabel];
    [self.funLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(imgView.mas_right).offset(18);
        make.centerY.equalTo(cell.contentView);
    }];
    
    if (section == 0) {
        if (row == 0) {
           // return self.userCell;
        }
    }
    if (section == 1) {
        if (row == 0) {
            imgView.image = [UIImage imageNamed:@"settings"];
            self.funLabel.text = @"设置";
        }
    }
    self.funLabel.textColor = [UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1.0];
    self.funLabel.font = [UIFont systemFontOfSize:14.0];
    self.funLabel.textAlignment = NSTextAlignmentLeft;
    cell.separatorInset = UIEdgeInsetsMake(0, 16, 0, 16);
    return cell;
}
@end


