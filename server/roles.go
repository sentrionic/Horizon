package horizon

type Role string

const (
	AdminRole Role = "admin"
	UserRole  Role = "user"
)

func (Role) Values() (kinds []string) {
	for _, r := range []Role{AdminRole, UserRole} {
		kinds = append(kinds, string(r))
	}
	return
}
