package utils


func IsNilString(stuff interface{}) string {
	if stuff == nil {
		return ""
	}
	return stuff.(string)
}

// func IsNilTime(stuff interface{}) neo4j.Date {
// 	fmt.Println(stuff)
// 	if stuff == nil {
// 		return time.Time{}.String().(neo4j.Date)
// 	}
// 	return stuff.(neo4j.Date)
// }
