import type { Access } from 'payload/config'
import type { FieldAccess } from 'payload/types'

import type { User } from '../payload-types'

export const isSelf: Access = ({ req: { user } }) => {
  if (user) {
    return {
      id: {
        equals: user.id,
      },
    }
  }
  // Reject everyone else
  return false
}

export const isSelfFieldLevel: FieldAccess<{ id: string }, unknown, User> = ({
  req: { user },
  id,
}) => {
  if (user?.id === id) return true
  return false
}