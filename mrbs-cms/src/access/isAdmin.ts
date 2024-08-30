import type { Access } from 'payload/config'
import type { FieldAccess } from 'payload/types'

import type { User } from '../payload-types'
import { checkRole } from '../utils/checkRole'

export const isAdmin: Access = ({ req: { user } }) => {
  // Need to be logged in and have an admin role
  if (user && checkRole('admin', user)) {
    return true
  }
  // Reject everyone else
  return false
}

export const isAdminFieldLevel: FieldAccess<{ id: string }, unknown, User> = ({
  req: { user },
  id,
}) => {
  // Return true or false based on if the user has an admin role
  if (checkRole('admin', user)) return true
  return false
}