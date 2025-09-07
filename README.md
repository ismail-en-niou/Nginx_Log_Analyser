# Nginx Log Analyzer

A powerful bash script for analyzing Nginx access logs and extracting valuable insights about traffic patterns.

## Features

- 📊 **Top IP Analysis**: Identify the most frequent visitors by IP address
- 🌐 **Request Path Analysis**: Discover the most accessed endpoints
- 🎨 **Colorized Output**: Easy-to-read color-coded results
- ⚙️ **Flexible Configuration**: Customize log file location and result count
- 📈 **Multiple Output Formats**: Choose between different display formats
- 🔍 **Error Handling**: Comprehensive validation and error reporting

## Installation

 Make the script executable:
```bash
chmod +x nginx-log-analyzer.sh
```

## Usage

### Basic Usage
```bash
./nginx-log-analyzer.sh
```
*Uses default log file (`ngnix-log.log`) and shows top 5 results*

### Specify Custom Log File
```bash
./nginx-log-analyzer.sh /var/log/nginx/access.log
```

## Output Example

```
Nginx Log Analyzer
===================
Analyzing: /var/log/nginx/access.log
Time of analysis: 2023-10-15 14:30:25

Total requests: 12,457

Top 5 IP addresses:
Count   IP Address
----------------------
1087    178.128.94.113
1087    142.93.136.176
1087    138.68.248.85
1086    159.89.185.30
 277    86.134.118.70
----------------------

Top 5 most requested paths:
Count   Request Path
----------------------
1245    /index.html
 892    /static/css/style.css
 756    /api/users
 543    /images/logo.png
 432    /about
----------------------
```

## File Structure

```
nginx-log-analyzer/
│
├── script.sh    # Main analysis script
├── ngnix-log.log           # Sample log file (optional)
├── README.md               # This documentation
(future feature)
```

## Common Nginx Log Locations

- `/var/log/nginx/access.log`
- `/var/log/nginx/access.log.1`
- `/var/log/nginx/access.log.2.gz` (compressed)
- `/usr/local/nginx/logs/access.log`

## Customization

### Changing Default Values
Edit these variables in the script:
```bash
DEFAULT_LOG="ngnix-log.log"    # Default log file
TOP_N=5                        # Default number of results
```

### Adding Color Schemes
Modify the color definitions section:
```bash
RED='\033[1;31m'
GREEN='\033[1;32m'
# Add more colors as needed
```

## Error Handling

The script includes comprehensive error checking for:
- ✅ File existence validation
- ✅ Read permissions verification
- ✅ Argument validation
- ✅ Number format checking
- ✅ Empty result handling

## Use Cases

- 🔍 **Security Monitoring**: Identify suspicious IP addresses
- 📈 **Performance Analysis**: Find most popular content
- 🚀 **Capacity Planning**: Understand traffic patterns
- 🐛 **Debugging**: Identify problematic endpoints

## Dependencies

- **Bash** (v4.0+ recommended)
- **Core utilities**: awk, sort, uniq, head
- **Nginx** (for log generation)

## Troubleshooting

### Permission Denied
```bash
sudo chmod +x nginx-log-analyzer.sh
```

### Log File Not Found
```bash
# Specify full path
./nginx-log-analyzer.sh /var/log/nginx/access.log
```

### No Results Displayed
- Check if log file contains data
- Verify log format matches expected pattern

## Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Test thoroughly
5. Submit a pull request

## License

MIT License - feel free to use this script for personal or commercial projects.

## Support

For issues and questions:
1. Check the troubleshooting section above
2. Ensure your log format matches supported formats
3. Verify file permissions and paths

## Version History

- **v1.0** (2023-10-15)
  - Initial release
  - Basic IP and request analysis
  - Colorized output
  - Argument parsing

---

**Note**: Always ensure you have proper permissions to access log files and comply with your organization's security policies when analyzing server logs.
-[text](https://roadmap.sh/projects/nginx-log-analyser)