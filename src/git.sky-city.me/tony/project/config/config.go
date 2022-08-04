package config
 
type DBConfig struct {
	Dialect  string
	Username string
	Password string
	Name     string
	Charset  string
}
 
func GetConfig() *DBConfig {
	return  &DBConfig{
			Dialect:  "mysql",
			Username: "root",
			Password: "***",
			Name:     "tableName",
			Charset:  "utf8",
	}
}
