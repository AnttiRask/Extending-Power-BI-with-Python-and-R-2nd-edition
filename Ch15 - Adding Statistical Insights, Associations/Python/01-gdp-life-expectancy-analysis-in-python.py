import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sb

dataset_url = 'http://bit.ly/gdp-life-expect-data'
df          = pd.read_csv(dataset_url)

print(df.head())

def distPlot(data, var, title, xlab, ylab, bins=100):
    hplot = sb.histplot(data[var], bins=bins)
    plt.title(title, fontsize=18)
    plt.xlabel(xlab, fontsize=16)
    plt.ylabel(ylab, fontsize=16)
    
    return hplot

def scatterPlot(data, varx, vary, title, xlab, ylab):
    
    # Create the scatter plot
    hplot = sb.scatterplot(x=data[varx], y=data[vary])
    
    # Get min and max for the x and y values
    x_min, x_max = data[varx].min(), data[varx].max()
    y_min, y_max = data[vary].min(), data[vary].max()
    
    # Add padding for better visualization
    x_padding = (x_max - x_min) * 0.05  # 5% padding
    y_padding = (y_max - y_min) * 0.05  # 5% padding
    
    # Set dynamic limits with padding
    plt.xlim([x_min - x_padding, x_max + x_padding])
    plt.ylim([y_min - y_padding, y_max + y_padding])
    
    # Set title and labels
    plt.title(title, fontsize=18)
    plt.xlabel(xlab, fontsize=16)
    plt.ylabel(ylab, fontsize=16)
    
    return hplot

distPlot(data=df, var='lifeExp', title='Life Expectancy',
         xlab='Life Expectancy (years)', ylab='Frequency')

plt.show()
 
distPlot(data=df, var='gdpPercap', title='GDP / capita',
         xlab='GDP / capita ($)', ylab='Frequency')

plt.show()

scatterPlot(data=df, varx='lifeExp', vary='gdpPercap',
            title='Life Expectancy vs GDP/Capita', xlab='Life Expectancy', ylab='GDP/Capita')

plt.show()

df[['lifeExp','gdpPercap']].corr(method='pearson')
df[['lifeExp','gdpPercap']].corr(method='spearman')
df[['lifeExp','gdpPercap']].corr(method='kendall')

corr_df = df[['lifeExp','gdpPercap']].corr(method='spearman')
corr_df

corr_df.index.name = 'rowname'
corr_df.reset_index(inplace=True)
corr_df
