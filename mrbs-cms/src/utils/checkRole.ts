import { User } from "payload/generated-types"

export const checkRole = (role: string, user?: User): boolean => {
  if (user) {
    if (typeof user.role === 'object') {
      if (user.role.code === role) return true
    }
    return false
  }

  return false
}